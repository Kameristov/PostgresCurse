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

run_thai:
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

exec_thai: 
	docker exec \
	-it postgres-curse psql \
	-d thai \
	-U postgres 

install_thai:
	wget -P ${CURDIR}/migration/ https://storage.googleapis.com/thaibus/thai_small.tar.gz
	sudo tar -xvf ${CURDIR}/migration/thai_small.tar.gz