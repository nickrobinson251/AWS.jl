@service S3

BUCKET_NAME = "aws-jl-test-issues---" * _now_formatted()

try
    S3.create_bucket(BUCKET_NAME)

    @testset "issue 223" begin
        # https://github.com/JuliaCloud/AWS.jl/issues/223
        body = "Hello World!"
        file_name = "contains spaces"

        try
            S3.put_object(BUCKET_NAME, file_name, Dict("body" => body))
            resp = S3.get_object(BUCKET_NAME, file_name)

            @test String(resp) == body
        finally
            S3.delete_object(BUCKET_NAME, file_name)
        end
    end

    @testset "issue 227" begin
        @testset "s3 public bucket" begin
            # https://github.com/JuliaCloud/AWS.jl/issues/227
            config = AWSConfig(; creds=nothing)
            resp = S3.get_object("www.invenia.ca", "index.html"; aws_config=config)

            @test !isempty(resp)
        end

        @testset "s3 private bucket" begin
            bucket_name = "aws-jl-test-issues---" * _now_formatted()
            file_name = "hello_world"

            try
                S3.create_bucket(bucket_name)
                S3.put_object(bucket_name, file_name)

                @test_throws AWSException S3.get_object(
                    bucket_name, file_name; aws_config=AWSConfig(; creds=nothing)
                )
            finally
                S3.delete_object(bucket_name, file_name)
                S3.delete_bucket(bucket_name)
            end
        end

        @testset "lambda" begin
            @service Lambda

            @test_throws NoCredentials Lambda.list_functions(;
                aws_config=AWSConfig(; creds=nothing)
            )
        end
    end

    @testset "issue 324" begin
        body = "Hello World!"
        file_name = "streaming.bin"

        try
            S3.put_object(BUCKET_NAME, file_name, Dict("body" => body))
            resp = S3.get_object(BUCKET_NAME, file_name)
            @test String(resp) == body

            # ERROR: MethodError: no method matching iterate(::Base.BufferStream)
            #   => BUG: header `response_stream` is pushed into the query...
            io = Base.BufferStream()
            S3.get_object(
                BUCKET_NAME,
                file_name,
                Dict("response_stream" => io, "return_stream" => true),
            )
            if bytesavailable(io) > 0
                @test String(readavailable(io)) == body
            else
                @test "no body data was available" == body
            end

        finally
            S3.delete_object(BUCKET_NAME, file_name)
        end
    end

    @testset "issue 466" begin
        file_name = "hang.txt"

        try
            S3.put_object(BUCKET_NAME, file_name)
            stream = S3.get_object(BUCKET_NAME, file_name, Dict("return_stream" => true))
            println("test #466")  # So we know if this is the reason for tests hanging.
            @test eof(stream)  # This will hang if #466 not fixed and using HTTP.jl v0.9.15+
            println("#466 fixed")
        finally
            S3.delete_object(BUCKET_NAME, file_name)
        end
    end

finally
    S3.delete_bucket(BUCKET_NAME)
end
