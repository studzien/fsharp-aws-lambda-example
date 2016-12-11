PROJECT=$(shell basename $(shell pwd))
.PHONY: all clean invoke rel restore

all: restore rel publish invoke

clean:
	-rm lambda.out
	-rm -rf rel/

invoke:
	aws lambda invoke --function-name $(PROJECT) lambda.out && \
		cat lambda.out

publish:
	aws lambda create-function --function-name $(PROJECT) \
		--runtime dotnetcore1.0 \
		--role $(AWS_ROLE) \
		--handler $(PROJECT)::FSharpLambdaFunction.LambdaHandler::myHandler \
		--zip-file fileb://rel/$(PROJECT).zip

rel: clean
	dotnet publish --configuration Release --output rel
	cd rel && zip -r $(PROJECT).zip *

restore:
	dotnet restore
