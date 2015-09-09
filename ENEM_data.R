#carrega o arquivo
file <- read.csv(file="data/result_MT_novo.csv", header=TRUE, sep=",")

#plota os graficos hits vs group e hits vs item
boxplot(file$hits ~ file$group)
boxplot(file$hits ~ file$item)

#transforma a variavel group de int para factor
file$group <- factor(file$group) 

#aplica o teste ANOVA - k=4
dados.anova <- aov(file$hits ~ file$group)
#mostra a tabela ANOVA
summary(dados.anova)
# Df    Sum Sq   Mean Sq F value   Pr(>F)    
# file$group   1 2.176e+12 2.176e+12   34.27 6.43e-07 ***
#   Residuals   42 2.666e+12 6.348e+10                     
# ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

#A probabilidade dos grupos serem iguais é de 6.43e-07 (número pequeno).
#Razoável assumir que os grupos são diferentes!
#Quanto menos o valor de p, mais vc pode ter confiança de que o que está
#sendo comparado é diferente. Se o valor for gde, pode ser que eles sejam iguais.

#Realiza e mostra os resultados de um pós-teste usando Tukey
TukeyHSD(dados.anova)
#TukeyHSD(aov(file$hits ~ file$group))
# Tukey multiple comparisons of means
# 95% family-wise confidence level
# 
# Fit: aov(formula = file$hits ~ file$group)

# $`file$group`
# diff       lwr         upr     p adj
# 2-1 -310311.73 -595698.6  -24924.872 0.0285047  - 28%
# 3-1 -528607.36 -813994.2 -243220.509 0.0000759  - 0%
# 4-1 -590219.64 -875606.5 -304832.781 0.0000120  - 0%
# 3-2 -218295.64 -503682.5   67091.219 0.1871472  - 18%
# 4-2 -279907.91 -565294.8    5478.946 0.0563070  - 5%
# 4-3  -61612.27 -346999.1  223774.582 0.9379048  - 93%

#os grupos sao diferentes, porem é razoavel assumir que apenas os grupos 3 e 4 sao iguais.
#Assim, nota-se que a proficiência dos alunos diminui ao longo da prova. 
#O cansaço e o tempo mais restrito de resposta nas últimas questões seriam uma possível justificativa para isso acontecer.
