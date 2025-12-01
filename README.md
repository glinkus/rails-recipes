# Recipe Tracker

A small Rails project built to learn Ruby, Rails, Prometheus and Grafana.

## Features
- CRUD for recipes  
- Seed data for quick demo  
- Prometheus `/metrics` endpoint  
- Custom metric that counts created recipes  
- Docker setup for Prometheus and Grafana

## Setup
```bash
bundle install
rails db:create db:migrate db:seed
rails server
```
App runs at: http://localhost:3000

## Metrics
```bash
docker compose up -d
```
Prometheus: http://localhost:9090
Grafana: http://localhost:3001

## Seeds
```bash
rails db:seed
```

