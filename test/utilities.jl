@testset "_merge - AbstractDict" begin
    @testset "Simple" begin
        expected = Dict("a" => 1, "b" => 2)

        a = Dict("a" => 1)
        b = Dict("b" => 2)

        @test AWS._merge(a, b) == expected
    end

    @testset "Complex Different Nested Dict Keys" begin
        expected = Dict("common" => Dict("b" => 2))

        a = Dict("common" => Dict("a" => 1))
        b = Dict("common" => Dict("b" => 2))

        @test AWS._merge(a, b) == expected
    end

    @testset "Complex Same Nested Dict Keys" begin
        expected = Dict("common" => Dict("a" => 2))

        a1 = Dict("common" => Dict("a" => 1))
        a2 = Dict("common" => Dict("a" => 2))

        @test AWS._merge(a1, a2) == expected
    end
end

@testset "mergewith(_merge) - AbstractDict" begin
    @testset "Simple" begin
        expected = Dict("a" => 1, "b" => 2)

        a = Dict("a" => 1)
        b = Dict("b" => 2)

        @test mergewith(AWS._merge, a, b) == expected
    end

    @testset "Complex Differed Nested Dict Keys" begin
        expected = Dict("common" => Dict("a" => 1, "b" => 2))

        a = Dict("common" => Dict("a" => 1))
        b = Dict("common" => Dict("b" => 2))

        @test mergewith(AWS._merge, a, b) == expected
    end

    @testset "Complex Same Nested Dict Keys" begin
        expected = Dict("common" => Dict("a" => 2))

        a1 = Dict("common" => Dict("a" => 1))
        a2 = Dict("common" => Dict("a" => 2))

        @test mergewith(AWS._merge, a1, a2) == expected
    end
end

@testset "_merge - AbstractString" begin
    expected = "b"

    @test AWS._merge("a", "b") == expected
end

@testset "_process_service_features" begin
    @testset "use default" begin
        user_feats = []
        default_feats = [:a => false]
        @test AWS._process_service_features(user_feats, default_feats) == :((; a=false))
    end

    @testset "user set" begin
        user_feats = [:(a = true)]
        default_feats = [:a => false]
        @test AWS._process_service_features(user_feats, default_feats) == :((; a=true))
    end

    @testset "unknown feature" begin
        user_feats = [:(b = true)]
        default_feats = [:a => false]
        @test_throws ArgumentError AWS._process_service_features(user_feats, default_feats)
    end

    @testset "unknown expression" begin
        user_feats = [:(true)]
        default_feats = [:a => false]
        @test_throws ArgumentError AWS._process_service_features(user_feats, default_feats)
    end

    @testset "no defaults" begin
        user_feats = []
        default_feats = []
        @test AWS._process_service_features(user_feats, default_feats) == :(NamedTuple())
    end
end
