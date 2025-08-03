#!/bin/bash

echo "Starting Redis cluster..."
docker compose up -d

echo "Waiting for cluster initialization..."
sleep 15

echo "Checking cluster status..."
echo "Node 1 status:"
docker exec redis-node-1 redis-cli -p 7000 ping

echo "Node 2 status:"
docker exec redis-node-2 redis-cli -p 7001 ping

echo "Cluster info:"
docker exec redis-node-1 redis-cli -p 7000 cluster info

echo "Cluster nodes:"
docker exec redis-node-1 redis-cli -p 7000 cluster nodes

echo ""
echo "Redis cluster is ready!"
echo "Node 1 (Master): localhost:7000"
echo "Node 2 (Slave):  localhost:7001"
echo ""
echo "Test with: redis-cli -c -p 7000"
echo "To stop the cluster: docker compose down"
echo "To view logs: docker compose logs -f"
