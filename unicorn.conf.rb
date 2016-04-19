working_directory ""
worker_processes 4
listen "/var/run/unicorn/justice-care_unicorn.sock", backlog: 64
pid "/var/run/unicorn/justice-care_unicorn.pid"
stderr_path "/var/log/justice-care_unicorn.stderr.log"
stdout_path "/var/log/justice-care_unicorn.stdout.log"
