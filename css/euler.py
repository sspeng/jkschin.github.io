for i in range(1,540):
	if i%20==1:
		print "<tr>"
	print r'<td class="problem_unsolved"><a href="https://projecteuler.net/problem=' + str(i) + r'">' + str(i) + r'</a></td>'
	if i%20==0:
		print "</tr>"
