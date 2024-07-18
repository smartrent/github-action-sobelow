FROM elixir:1.11.2

COPY sobelow.sh /sobelow.sh
COPY empty.sarif /empty.sarif

ENV DIR=GITHUB_WORKSPACE

WORKDIR ${DIR}

ENTRYPOINT ["/sobelow.sh"]