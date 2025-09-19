# 🚗 Oficina Mecânica – Esquema Conceitual de Banco de Dados

Este repositório contém o esquema conceitual de um sistema de **controle e gerenciamento de ordens de serviço em uma oficina mecânica**.

## 🎯 Objetivo
Cria o esquema conceitual para o contexto de oficina com base na narrativa fornecida

## 📖 Narrativa
- Clientes levam veículos à oficina mecânica para reparos ou revisões.  
- Cada veículo é designado a uma equipe de mecânicos, que abre uma **Ordem de Serviço (OS)** com data de entrega.  
- A OS registra serviços (consultados em tabela de mão de obra) e peças utilizadas.  
- O cliente autoriza os serviços.  
- A mesma equipe avalia e executa os serviços.  
- Cada mecânico possui código, nome, endereço e especialidade.  
- Cada OS possui: número, data de emissão, valor, status e previsão de conclusão.

## 🏗️ Modelo Conceitual (EER)
- **Cliente** possui um ou mais **Veículos**.  
- Cada **Veículo** pode gerar várias **Ordens de Serviço (OS)**.  
- Cada **OS** é atribuída a uma **Equipe**, que é composta por vários **Mecânicos**.  
- Uma **OS** pode incluir diversos **Serviços** e **Peças**.

## APROMORAMENTO:

📌 Etapas do Projeto

Criação do esquema lógico a partir do modelo ER.

Implementação do script SQL para criação do banco OficinaDB.

Inserção de dados de teste (clientes, veículos, equipes, mecânicos, ordens de serviço, serviços e peças).

Elaboração de consultas SQL utilizando:

WHERE (filtros)

Expressões para atributos derivados

Ordenações com ORDER BY

Agrupamentos com HAVING

JOIN entre múltiplas tabelas


