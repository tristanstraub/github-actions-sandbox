.PHONY: container
container:
	docker build -t github-actions-sandbox .

.PHONY: run
run: container
	docker run -v$(PWD):/project -w /project -ti github-actions-sandbox
