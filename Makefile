NAME = quay.io/baselibrary/java
REPO = git@github.com:baselibrary/docker-java.git
TAGS = 6 7 8

all: build

build: $(TAGS)

release: $(TAGS)
	docker push ${NAME}

sync-branches:
	git fetch $(REPO) master
	@$(foreach tag, $(TAGS), git branch -f $(tag) FETCH_HEAD;)
	@$(foreach tag, $(TAGS), git push $(REPO) $(tag);)
	@$(foreach tag, $(TAGS), git branch -D $(tag);)

.PHONY: $(TAGS)
$(TAGS):
	docker build -t $(NAME):$@ $@
