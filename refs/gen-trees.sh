echo "Generating tree diagrams..."

pyang -f tree --tree-line-length 69 ../ietf-quic-client@*.yang \
    > tree-ietf-quic-client.txt
pyang -f tree --tree-line-length 69 ../ietf-quic-server@*.yang \
    > tree-ietf-quic-server.txt
