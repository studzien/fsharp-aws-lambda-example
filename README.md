fsharp-aws-lambda-example
=========================

This is an example F# AWS Lambda

Prerequisites
-------------
* Mono
* DotNet CLI
* AWS CLI

Running
-------

When you run the following command:

```
AWS_ROLE=arn:aws:iam::xyz:role/service-role/abc make all
```

```AWS_ROLE``` is an existing role, a running lambda will have all the
credentials assigned to this role.

If everything's fine, you should eventually see the result of the invocation:
```
Hello World from F#!
```
