# `Sinatra::Async` Bug Repro

https://github.com/raggi/async_sinatra/pull/42

## Steps to reproduce:

- Clone the repository
- Run `bundle install`
- Start the server with: `bundle exec rackup -p 4321`
- Send a `GET` request `/good` with curl: `curl http://localhost:4321/good` and
  see 1 entry written to STDOUT
- Send a `GET` request `/bad` with curl: `curl http://localhost:4321/bad` and
  see 2 entries written to STDOUT
