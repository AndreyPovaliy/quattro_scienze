from array import *

print("mkdir ./workspace/article")
print("mkdir ./workspace/article/str")
print("touch ./workspace/article/str/main_article.R")
print("mkdir ./workspace/article/str/deconst")
print("mkdir ./workspace/article/str/deconst/text_article")
print("\n")

print('echo \"FileName <- \\"./workspace/article/str/text_article.txt\\"\">> ./workspace/article/str/main_article.R')
print("\n")

filename = "./create/article/plan.txt"
topics = []

file =  open(filename, "r").read().split('\n')

for line in file:
  topics.append(line)


for topic in topics:
  print(f'echo "# {topic} ------------------------------------------------------------" >> ./workspace/article/str/main_article.R')
  print(f'echo \"source(\\"./workspace/article/str/deconst/{topic}.R\\")\n\n\" >> ./workspace/article/str/main_article.R')
  print(f'touch ./workspace/article/str/deconst/{topic}.R')
  print(f'echo "escribir_rT(\\"./workspace/article/str/deconst/text_article/{topic}.txt\\")\" >> ./workspace/article/str/deconst/{topic}.R')
  print(f'touch ./workspace/article/str/deconst/text_article/{topic}.txt')
  print(f'echo \"# {topic}" >> ./workspace/article/str/deconst/text_article/{topic}.txt')
  print("\n")



