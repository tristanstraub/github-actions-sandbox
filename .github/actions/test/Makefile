# This makefile can be used to test the github action before pushing it to github

.PHONY: run
run:
	docker volume create --name maven
	docker run --rm -v "$(HOME)/.m2:/source" -v maven:/root/.m2 -w /source alpine sh -c "cp -a ./ /root/.m2"

	docker volume create --name github-actions-sandbox-data
	docker run --rm -v "$(PWD)/../../..:/source" -v github-actions-sandbox-data:/github/workspace -w /source alpine sh -c "cp -r ./ /github/workspace"

	docker build -t github-actions-sandbox .

	docker run \
		-v m2:/root/.m2 \
		-v github-actions-sandbox-data:/github/workspace \
		-w /github/workspace github-actions-sandbox
