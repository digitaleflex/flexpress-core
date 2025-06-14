up:
	docker compose up -d

down:
	docker compose down

build:
	docker compose build

reset:
	docker compose down -v && docker compose up -d --build
