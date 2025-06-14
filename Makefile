up:
	docker compose up -d

down:
	docker compose down

build:
	docker compose build

reset:
	docker compose down -v && docker compose up -d --build

init:
	powershell -File scripts/find-available-port.ps1
	docker compose up -d

.PHONY: up down build reset init
