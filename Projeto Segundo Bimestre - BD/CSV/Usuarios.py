# Esse código deve ser usado para gerar um arquivo CSV de uma tabela do banco de dados do MYSQL, somente funciona se a tabela tiver algum registro.
# Ficar atento em preencher os campos da SENHA e verificar o caminho do arquivo.

import csv
import mysql.connector

# Conexão com o banco de dados
conexao = mysql.connector.connect(
    host='localhost',         # ou outro host se for remoto
    user='root',              # substitua pelo seu usuário
    password=' ',     # substitua pela sua senha ------------------- COLOCAR SUA SENHA!!
    database='agenda_contatos'  # nome do seu banco
)

cursor = conexao.cursor()

# Consulta para buscar os dados da tabela usuario
query = "SELECT id_usuario, nome_completo, email, data_nascimento FROM usuario"
cursor.execute(query)

# Caminho do arquivo CSV de saída
caminho_csv = r"E:\Trabalho UVV\Projeto Segundo Bimestre - BD\CSV\usuarios.csv"     #VERIFICAR SE O CAMINHO PARA BAIXAR ESTÁ CERTO!!

# Escreve os dados no arquivo CSV
with open(caminho_csv, "w", newline='', encoding='utf-8') as arquivo_csv:
    escritor = csv.writer(arquivo_csv)
    escritor.writerow(['id_usuario', 'nome_completo', 'email', 'data_nascimento'])  # cabeçalhos

    for linha in cursor:
        escritor.writerow(linha)

# Finaliza conexões
cursor.close()
conexao.close()

print("Exportação concluída com sucesso para:", caminho_csv)
