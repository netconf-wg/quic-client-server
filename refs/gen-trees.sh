echo "Generating tree diagrams..."

pyang -f tree --tree-line-length 69 --tree-print-groupings \
      --tree-no-expand-uses ../ietf-quic-client@*.yang \
      > tree-ietf-quic-client.txt
pyang -f tree --tree-line-length 69 --tree-print-groupings \
      --tree-no-expand-uses ../ietf-quic-server@*.yang \
      > tree-ietf-quic-server.txt
