FROM codefresh/cli

ADD runner-entrypoint.sh /runner-entrypoint.sh

ENTRYPOINT ["/runner-entrypoint.sh"]
