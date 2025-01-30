#!/bin/bash

MONGO_CONTAINER=core5g-mongo-1

: 'open5gs-dbctl: Open5GS Database Configuration Tool (0.9.1)
COMMANDS:
   add {imsi key opc}: adds a user to the database with default values
   add {imsi ip key opc}: adds a user to the database with default values and a IPv4 address for the UE
   addT1 {imsi key opc}: adds a user to the database with 3 differents apns
   addT1 {imsi ip key opc}: adds a user to the database with 3 differents apns and the same IPv4 address for the each apn
   remove {imsi}: removes a user from the database
   reset: WIPES OUT the database and restores it to an empty default
   static_ip {imsi ip4}: adds a static IP assignment to an already-existing user
   static_ip6 {imsi ip6}: adds a static IPv6 assignment to an already-existing user
   type {imsi type}: changes the PDN-Type of the first PDN: 0 = IPv4, 1 = IPv6, 2 = IPv4v6, 3 = v4 OR v6
   help: displays this message and exits
   default values are as follows: APN "internet", dl_bw/ul_bw 1 Gbps, PGW address is 127.0.0.3, IPv4 only
'

docker cp open5gs-dbctl $MONGO_CONTAINER:/

docker exec -ti $MONGO_CONTAINER /open5gs-dbctl add_ue_with_slice 999700000053410 2C9623736F9F37BD7BF6F6797F3CA9AF 09C74182747FA179A650BBE2147FCCDC internet 1 111111
docker exec -ti $MONGO_CONTAINER /open5gs-dbctl add_ue_with_slice 999700000053411 02366BDEC178628BC809841190A3F316 4BDB2D50BA9AFEC95D62928620EF6D34 internet 1 01b207
docker exec -ti $MONGO_CONTAINER /open5gs-dbctl add_ue_with_slice 999700000053412 0797DFBC15E9F720E603511B51052A32 051C63AF2436428F5CBF7AA6EE589363 internet 1 111111
docker exec -ti $MONGO_CONTAINER /open5gs-dbctl add_ue_with_slice 999700000053413 E4902EF16990CD9BB1FCC283D42D60EE 7309B7233842606E80C64DF837A6C9B7 internet 1 111111
docker exec -ti $MONGO_CONTAINER /open5gs-dbctl add_ue_with_slice 999700000053414 7DCCA3A2B224BF502DE9BF843A0B8115 090FF022CA60DCF1F9A223BA3203EF8E internet 1 111111
docker exec -ti $MONGO_CONTAINER /open5gs-dbctl add_ue_with_slice 999700000053415 84736078DCA5D77E8D75671AA7C4604D 9058DF60C23321A71EE9A8222DC20C7F internet 1 111111
docker exec -ti $MONGO_CONTAINER /open5gs-dbctl add_ue_with_slice 999700000053416 E8F2A5B551FC6C0E62CCDDA0A8DBF037 32A582B1B27FA0B5D7A5A679E672FC7A internet 1 111111
docker exec -ti $MONGO_CONTAINER /open5gs-dbctl add_ue_with_slice 999700000053417 E9E0422B8B8706B4FB018A66D24322FD 6081AE639F446D29892EB6084B087391 internet 1 111111
docker exec -ti $MONGO_CONTAINER /open5gs-dbctl add_ue_with_slice 001010000010001 6EB991AD5146479A21B10989305468C6 1021913D2248AC9A1DA3D426AF63235A internet 1 111111
docker exec -ti $MONGO_CONTAINER /open5gs-dbctl add_ue_with_slice 999700000053419 DDD0C30B2847108319B66C222B12DCAE 668DCCE98E58871288454100B3DAB8C2 internet 1 111111

docker exec -ti $MONGO_CONTAINER /open5gs-dbctl static_ip 999700000053410 10.45.0.5
docker exec -ti $MONGO_CONTAINER /open5gs-dbctl static_ip 999700000053411 10.45.0.10
docker exec -ti $MONGO_CONTAINER /open5gs-dbctl static_ip 999700000053412 10.45.0.15
docker exec -ti $MONGO_CONTAINER /open5gs-dbctl static_ip 999700000053413 10.45.0.20
docker exec -ti $MONGO_CONTAINER /open5gs-dbctl static_ip 999700000053414 10.45.0.25
docker exec -ti $MONGO_CONTAINER /open5gs-dbctl static_ip 999700000053415 10.45.0.30
docker exec -ti $MONGO_CONTAINER /open5gs-dbctl static_ip 999700000053416 10.45.0.35
docker exec -ti $MONGO_CONTAINER /open5gs-dbctl static_ip 999700000053417 10.45.0.40
docker exec -ti $MONGO_CONTAINER /open5gs-dbctl static_ip 001010000010001 10.45.0.45
docker exec -ti $MONGO_CONTAINER /open5gs-dbctl static_ip 999700000053419 10.45.0.50
