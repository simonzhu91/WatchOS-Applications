# Rename all *.txt to *.text
# Rename all *.foo to *.bar
for f in *.gif; 
	do mv -- "$f" "${f%.gif}.png"; 
done