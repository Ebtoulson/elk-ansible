Local
---
Install dependencies:
`ansible-galaxy install -r requirements.yml`

Create vagrant VM:
`vagrant up`

Add entries to `/etc/hosts`:

```
192.168.9.90  logs
```

Navigate to `http://logs:5601/` for Kibana

### Benchmarks/Simulate Traffic
Really simple benchmark that tests the logstash config

```
cd benchmark
bundle install

LOGSTASH_HOST=logs ruby client.rb
```

Don't want to send thousands of requests?
Pass in `SLOW_DOWN` to the script to simulate traffic. 


AWS
---
Set required environment vars in template.json
Change fields to match your setup (`source_ami`, `subnet_id`, etc)

### Build
`packer build template.json`