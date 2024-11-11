CURDIR=$(shell pwd)

run:
	docker run \
	--rm \
	--name postgres-curse \
	-p 5432:5432 \
	-e POSTGRES_USER=postgres \
	-e POSTGRES_PASSWORD=postgres \
	-e POSTGRES_DB=postgres \
	-v ${CURDIR}/db:/var/lib/postgresql/data\
	-d postgres:16.4

run-thai:
	docker run \
	--rm \
	--name postgres-curse \
	-p 5432:5432 \
	-e POSTGRES_USER=postgres \
	-e POSTGRES_PASSWORD=postgres \
	-e POSTGRES_DB=postgres \
	-v ${CURDIR}/migration/thai.sql:/docker-entrypoint-initdb.d/thai.sql \
	-v ${CURDIR}/db:/var/lib/postgresql/data\
	-d postgres:16.4


exec: 
	docker exec \
	-it postgres-curse psql \
	-d postgres \
	-U postgres 