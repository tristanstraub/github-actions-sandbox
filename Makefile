.PHONY: container
container:
	docker build -t github-actions-sandbox .

NAME=$(shell uuidgen | sed -e 's/-//g' | cut -c 1-6)_$(shell uuidgen | sed -e 's/-//g')
LABEL=$(shell uuidgen | sed -e 's/-//g' | cut -c 1-6)

.PHONY: run
run: container
	docker run --name $(NAME) --label $(LABEL) --workdir /github/workspace --rm \
		-e HOME -e GITHUB_REF -e GITHUB_SHA -e GITHUB_REPOSITORY -e GITHUB_RUN_ID \
		-e GITHUB_RUN_NUMBER -e GITHUB_ACTOR -e GITHUB_WORKFLOW -e GITHUB_HEAD_REF \
		-e GITHUB_BASE_REF -e GITHUB_EVENT_NAME -e GITHUB_WORKSPACE -e GITHUB_ACTION \
		-e GITHUB_EVENT_PATH -e RUNNER_OS -e RUNNER_TOOL_CACHE -e RUNNER_TEMP \
		-e RUNNER_WORKSPACE -e ACTIONS_RUNTIME_URL -e ACTIONS_RUNTIME_TOKEN \
		-e GITHUB_ACTIONS=true \
		-v "$(PWD):/github/workspace" \
		-v "$(HOME)/.m2:/root/.m2" \
		github-actions-sandbox
