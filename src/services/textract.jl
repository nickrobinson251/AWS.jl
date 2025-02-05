# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: textract
using AWS.Compat
using AWS.UUIDs

"""
    analyze_document(document, feature_types)
    analyze_document(document, feature_types, params::Dict{String,<:Any})

Analyzes an input document for relationships between detected items.  The types of
information returned are as follows:    Form data (key-value pairs). The related
information is returned in two Block objects, each of type KEY_VALUE_SET: a KEY Block
object and a VALUE Block object. For example, Name: Ana Silva Carolina contains a key and
value. Name: is the key. Ana Silva Carolina is the value.   Table and table cell data. A
TABLE Block object contains information about a detected table. A CELL Block object is
returned for each cell in a table.   Lines and words of text. A LINE Block object contains
one or more WORD Block objects. All lines and words that are detected in the document are
returned (including text that doesn't have a relationship with the value of FeatureTypes).
  Selection elements such as check boxes and option buttons (radio buttons) can be detected
in form data and in tables. A SELECTION_ELEMENT Block object contains information about a
selection element, including the selection status. You can choose which type of analysis to
perform by specifying the FeatureTypes list.  The output is returned in a list of Block
objects.  AnalyzeDocument is a synchronous operation. To analyze documents asynchronously,
use StartDocumentAnalysis. For more information, see Document Text Analysis.

# Arguments
- `document`: The input document as base64-encoded bytes or an Amazon S3 object. If you use
  the AWS CLI to call Amazon Textract operations, you can't pass image bytes. The document
  must be an image in JPEG or PNG format. If you're using an AWS SDK to call Amazon Textract,
  you might not need to base64-encode image bytes that are passed using the Bytes field.
- `feature_types`: A list of the types of analysis to perform. Add TABLES to the list to
  return information about the tables that are detected in the input document. Add FORMS to
  return detected form data. To perform both types of analysis, add TABLES and FORMS to
  FeatureTypes. All lines and words detected in the document are included in the response
  (including text that isn't related to the value of FeatureTypes).

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"HumanLoopConfig"`: Sets the configuration for the human in the loop workflow for
  analyzing documents.
"""
function analyze_document(
    Document, FeatureTypes; aws_config::AbstractAWSConfig=global_aws_config()
)
    return textract(
        "AnalyzeDocument",
        Dict{String,Any}("Document" => Document, "FeatureTypes" => FeatureTypes);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function analyze_document(
    Document,
    FeatureTypes,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return textract(
        "AnalyzeDocument",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("Document" => Document, "FeatureTypes" => FeatureTypes),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    analyze_expense(document)
    analyze_expense(document, params::Dict{String,<:Any})

Analyzes an input document for financially related relationships between text. Information
is returned as ExpenseDocuments and seperated as follows.    LineItemGroups- A data set
containing LineItems which store information about the lines of text, such as an item
purchased and its price on a receipt.    SummaryFields- Contains all other information a
receipt, such as header information or the vendors name.

# Arguments
- `document`:

"""
function analyze_expense(Document; aws_config::AbstractAWSConfig=global_aws_config())
    return textract(
        "AnalyzeExpense",
        Dict{String,Any}("Document" => Document);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function analyze_expense(
    Document,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return textract(
        "AnalyzeExpense",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("Document" => Document), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    detect_document_text(document)
    detect_document_text(document, params::Dict{String,<:Any})

Detects text in the input document. Amazon Textract can detect lines of text and the words
that make up a line of text. The input document must be an image in JPEG or PNG format.
DetectDocumentText returns the detected text in an array of Block objects.  Each document
page has as an associated Block of type PAGE. Each PAGE Block object is the parent of LINE
Block objects that represent the lines of detected text on a page. A LINE Block object is a
parent for each word that makes up the line. Words are represented by Block objects of type
WORD.  DetectDocumentText is a synchronous operation. To analyze documents asynchronously,
use StartDocumentTextDetection. For more information, see Document Text Detection.

# Arguments
- `document`: The input document as base64-encoded bytes or an Amazon S3 object. If you use
  the AWS CLI to call Amazon Textract operations, you can't pass image bytes. The document
  must be an image in JPEG or PNG format. If you're using an AWS SDK to call Amazon Textract,
  you might not need to base64-encode image bytes that are passed using the Bytes field.

"""
function detect_document_text(Document; aws_config::AbstractAWSConfig=global_aws_config())
    return textract(
        "DetectDocumentText",
        Dict{String,Any}("Document" => Document);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function detect_document_text(
    Document,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return textract(
        "DetectDocumentText",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("Document" => Document), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    get_document_analysis(job_id)
    get_document_analysis(job_id, params::Dict{String,<:Any})

Gets the results for an Amazon Textract asynchronous operation that analyzes text in a
document. You start asynchronous text analysis by calling StartDocumentAnalysis, which
returns a job identifier (JobId). When the text analysis operation finishes, Amazon
Textract publishes a completion status to the Amazon Simple Notification Service (Amazon
SNS) topic that's registered in the initial call to StartDocumentAnalysis. To get the
results of the text-detection operation, first check that the status value published to the
Amazon SNS topic is SUCCEEDED. If so, call GetDocumentAnalysis, and pass the job identifier
(JobId) from the initial call to StartDocumentAnalysis.  GetDocumentAnalysis returns an
array of Block objects. The following types of information are returned:    Form data
(key-value pairs). The related information is returned in two Block objects, each of type
KEY_VALUE_SET: a KEY Block object and a VALUE Block object. For example, Name: Ana Silva
Carolina contains a key and value. Name: is the key. Ana Silva Carolina is the value.
Table and table cell data. A TABLE Block object contains information about a detected
table. A CELL Block object is returned for each cell in a table.   Lines and words of text.
A LINE Block object contains one or more WORD Block objects. All lines and words that are
detected in the document are returned (including text that doesn't have a relationship with
the value of the StartDocumentAnalysis FeatureTypes input parameter).    Selection elements
such as check boxes and option buttons (radio buttons) can be detected in form data and in
tables. A SELECTION_ELEMENT Block object contains information about a selection element,
including the selection status. Use the MaxResults parameter to limit the number of blocks
that are returned. If there are more results than specified in MaxResults, the value of
NextToken in the operation response contains a pagination token for getting the next set of
results. To get the next page of results, call GetDocumentAnalysis, and populate the
NextToken request parameter with the token value that's returned from the previous call to
GetDocumentAnalysis. For more information, see Document Text Analysis.

# Arguments
- `job_id`: A unique identifier for the text-detection job. The JobId is returned from
  StartDocumentAnalysis. A JobId value is only valid for 7 days.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"MaxResults"`: The maximum number of results to return per paginated call. The largest
  value that you can specify is 1,000. If you specify a value greater than 1,000, a maximum
  of 1,000 results is returned. The default value is 1,000.
- `"NextToken"`: If the previous response was incomplete (because there are more blocks to
  retrieve), Amazon Textract returns a pagination token in the response. You can use this
  pagination token to retrieve the next set of blocks.
"""
function get_document_analysis(JobId; aws_config::AbstractAWSConfig=global_aws_config())
    return textract(
        "GetDocumentAnalysis",
        Dict{String,Any}("JobId" => JobId);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function get_document_analysis(
    JobId, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return textract(
        "GetDocumentAnalysis",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("JobId" => JobId), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    get_document_text_detection(job_id)
    get_document_text_detection(job_id, params::Dict{String,<:Any})

Gets the results for an Amazon Textract asynchronous operation that detects text in a
document. Amazon Textract can detect lines of text and the words that make up a line of
text. You start asynchronous text detection by calling StartDocumentTextDetection, which
returns a job identifier (JobId). When the text detection operation finishes, Amazon
Textract publishes a completion status to the Amazon Simple Notification Service (Amazon
SNS) topic that's registered in the initial call to StartDocumentTextDetection. To get the
results of the text-detection operation, first check that the status value published to the
Amazon SNS topic is SUCCEEDED. If so, call GetDocumentTextDetection, and pass the job
identifier (JobId) from the initial call to StartDocumentTextDetection.
GetDocumentTextDetection returns an array of Block objects.  Each document page has as an
associated Block of type PAGE. Each PAGE Block object is the parent of LINE Block objects
that represent the lines of detected text on a page. A LINE Block object is a parent for
each word that makes up the line. Words are represented by Block objects of type WORD. Use
the MaxResults parameter to limit the number of blocks that are returned. If there are more
results than specified in MaxResults, the value of NextToken in the operation response
contains a pagination token for getting the next set of results. To get the next page of
results, call GetDocumentTextDetection, and populate the NextToken request parameter with
the token value that's returned from the previous call to GetDocumentTextDetection. For
more information, see Document Text Detection.

# Arguments
- `job_id`: A unique identifier for the text detection job. The JobId is returned from
  StartDocumentTextDetection. A JobId value is only valid for 7 days.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"MaxResults"`: The maximum number of results to return per paginated call. The largest
  value you can specify is 1,000. If you specify a value greater than 1,000, a maximum of
  1,000 results is returned. The default value is 1,000.
- `"NextToken"`: If the previous response was incomplete (because there are more blocks to
  retrieve), Amazon Textract returns a pagination token in the response. You can use this
  pagination token to retrieve the next set of blocks.
"""
function get_document_text_detection(
    JobId; aws_config::AbstractAWSConfig=global_aws_config()
)
    return textract(
        "GetDocumentTextDetection",
        Dict{String,Any}("JobId" => JobId);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function get_document_text_detection(
    JobId, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return textract(
        "GetDocumentTextDetection",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("JobId" => JobId), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    start_document_analysis(document_location, feature_types)
    start_document_analysis(document_location, feature_types, params::Dict{String,<:Any})

Starts the asynchronous analysis of an input document for relationships between detected
items such as key-value pairs, tables, and selection elements.  StartDocumentAnalysis can
analyze text in documents that are in JPEG, PNG, and PDF format. The documents are stored
in an Amazon S3 bucket. Use DocumentLocation to specify the bucket name and file name of
the document.   StartDocumentAnalysis returns a job identifier (JobId) that you use to get
the results of the operation. When text analysis is finished, Amazon Textract publishes a
completion status to the Amazon Simple Notification Service (Amazon SNS) topic that you
specify in NotificationChannel. To get the results of the text analysis operation, first
check that the status value published to the Amazon SNS topic is SUCCEEDED. If so, call
GetDocumentAnalysis, and pass the job identifier (JobId) from the initial call to
StartDocumentAnalysis. For more information, see Document Text Analysis.

# Arguments
- `document_location`: The location of the document to be processed.
- `feature_types`: A list of the types of analysis to perform. Add TABLES to the list to
  return information about the tables that are detected in the input document. Add FORMS to
  return detected form data. To perform both types of analysis, add TABLES and FORMS to
  FeatureTypes. All lines and words detected in the document are included in the response
  (including text that isn't related to the value of FeatureTypes).

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"ClientRequestToken"`: The idempotent token that you use to identify the start request.
  If you use the same token with multiple StartDocumentAnalysis requests, the same JobId is
  returned. Use ClientRequestToken to prevent the same job from being accidentally started
  more than once. For more information, see Calling Amazon Textract Asynchronous Operations.
- `"JobTag"`: An identifier that you specify that's included in the completion notification
  published to the Amazon SNS topic. For example, you can use JobTag to identify the type of
  document that the completion notification corresponds to (such as a tax form or a receipt).
- `"KMSKeyId"`: The KMS key used to encrypt the inference results. This can be in either
  Key ID or Key Alias format. When a KMS key is provided, the KMS key will be used for
  server-side encryption of the objects in the customer bucket. When this parameter is not
  enabled, the result will be encrypted server side,using SSE-S3.
- `"NotificationChannel"`: The Amazon SNS topic ARN that you want Amazon Textract to
  publish the completion status of the operation to.
- `"OutputConfig"`: Sets if the output will go to a customer defined bucket. By default,
  Amazon Textract will save the results internally to be accessed by the GetDocumentAnalysis
  operation.
"""
function start_document_analysis(
    DocumentLocation, FeatureTypes; aws_config::AbstractAWSConfig=global_aws_config()
)
    return textract(
        "StartDocumentAnalysis",
        Dict{String,Any}(
            "DocumentLocation" => DocumentLocation, "FeatureTypes" => FeatureTypes
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function start_document_analysis(
    DocumentLocation,
    FeatureTypes,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return textract(
        "StartDocumentAnalysis",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "DocumentLocation" => DocumentLocation, "FeatureTypes" => FeatureTypes
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    start_document_text_detection(document_location)
    start_document_text_detection(document_location, params::Dict{String,<:Any})

Starts the asynchronous detection of text in a document. Amazon Textract can detect lines
of text and the words that make up a line of text.  StartDocumentTextDetection can analyze
text in documents that are in JPEG, PNG, and PDF format. The documents are stored in an
Amazon S3 bucket. Use DocumentLocation to specify the bucket name and file name of the
document.   StartTextDetection returns a job identifier (JobId) that you use to get the
results of the operation. When text detection is finished, Amazon Textract publishes a
completion status to the Amazon Simple Notification Service (Amazon SNS) topic that you
specify in NotificationChannel. To get the results of the text detection operation, first
check that the status value published to the Amazon SNS topic is SUCCEEDED. If so, call
GetDocumentTextDetection, and pass the job identifier (JobId) from the initial call to
StartDocumentTextDetection. For more information, see Document Text Detection.

# Arguments
- `document_location`: The location of the document to be processed.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"ClientRequestToken"`: The idempotent token that's used to identify the start request.
  If you use the same token with multiple StartDocumentTextDetection requests, the same JobId
  is returned. Use ClientRequestToken to prevent the same job from being accidentally started
  more than once. For more information, see Calling Amazon Textract Asynchronous Operations.
- `"JobTag"`: An identifier that you specify that's included in the completion notification
  published to the Amazon SNS topic. For example, you can use JobTag to identify the type of
  document that the completion notification corresponds to (such as a tax form or a receipt).
- `"KMSKeyId"`: The KMS key used to encrypt the inference results. This can be in either
  Key ID or Key Alias format. When a KMS key is provided, the KMS key will be used for
  server-side encryption of the objects in the customer bucket. When this parameter is not
  enabled, the result will be encrypted server side,using SSE-S3.
- `"NotificationChannel"`: The Amazon SNS topic ARN that you want Amazon Textract to
  publish the completion status of the operation to.
- `"OutputConfig"`: Sets if the output will go to a customer defined bucket. By default
  Amazon Textract will save the results internally to be accessed with the
  GetDocumentTextDetection operation.
"""
function start_document_text_detection(
    DocumentLocation; aws_config::AbstractAWSConfig=global_aws_config()
)
    return textract(
        "StartDocumentTextDetection",
        Dict{String,Any}("DocumentLocation" => DocumentLocation);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function start_document_text_detection(
    DocumentLocation,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return textract(
        "StartDocumentTextDetection",
        Dict{String,Any}(
            mergewith(
                _merge, Dict{String,Any}("DocumentLocation" => DocumentLocation), params
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
