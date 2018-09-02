.PHONY: test

install:
	mix deps.get

console:
	iex -S mix

docs:
	mix docs

release:
	sed -i '' -e 's/{:github, "~> [0-9\.]*"}/{:github, "~> $(VERSION)"}/' README.md && \
	sed -i '' -e 's/@version "[0-9\.]*"/@version "$(VERSION)"/' mix.exs && \
	git add README.md mix.exs && \
	git commit -v -m "Release v$(VERSION)" && \
	git tag "v$(VERSION)"

publish:
	git push && \
	git push --tags && \
	mix hex.publish

test:
	iex -S mix test --trace
