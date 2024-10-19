echo "Generating tree diagrams..."

# ietf-quic-client
# grouping
pyang -f tree --tree-line-length 69 --tree-print-groupings \
      --tree-no-expand-uses ../ietf-quic-client@*.yang \
      | grep -A 4 grouping > tree-ietf-quic-client-grouping.txt
# augment
pyang -f tree --tree-line-length 69 --tree-print-groupings \
      --tree-no-expand-uses ../ietf-quic-client@*.yang \
      | grep -A 4 augment > tree-ietf-quic-client-augment.txt

# ietf-quic-server
# grouping
pyang -f tree --tree-line-length 69 --tree-print-groupings \
      --tree-no-expand-uses ../ietf-quic-server@*.yang \
      | grep -A 4 grouping > tree-ietf-quic-server-grouping.txt
# augment
pyang -f tree --tree-line-length 69 --tree-print-groupings \
      --tree-no-expand-uses ../ietf-quic-server@*.yang \
      | grep -A 4 augment > tree-ietf-quic-server-augment.txt

