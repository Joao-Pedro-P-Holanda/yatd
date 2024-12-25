![App logo](./docs/logo.png)

# Yet Another ToDO

Este projeto consiste de uma Todo list implementada com o framework Ruby on Rails, mas com certos
diferenciais de outras versões dessa implementação comum: além da definição de tarefas, 
você pode também agendar compras online que pretenda fazer, e visualizar os gastos feitos com
essas compras.

## Funcionalidades

- Criar diferentes listas de tarefas.
- Manipular tarefas individuais em cada lista.
- Criar compras agendadas.
- Controlar quais itens serão comprados e visualizar o balanço após as compras.

## Banco de Dados

O banco de dados escolhido para essa aplicação foi o PostgreSQL pela minha familiaridade anterior,
juntamente com a facilidade de configuração e uso.

### Entidades

Abaixo está um diagrama das principais entidades da aplicação e seus relacionamentos:

```mermaid
erDiagram 
    user ||--o{ task_list: "Pode ou não ter listas"
    user ||--o{ purchase: "Pode ou não ter compras" 
    task_list ||--|{ task : "Possui uma ou mais"
    task ||--o{ task_check : "Pode ter várias"
    task ||--o{ task_tag : "Pode ter várias"
    purchase ||--|{ purchase_link : "Possui um ou mais" 

    user {
        int id
        string name
        string email
        datetime updated_at
        datetime created_at
    }

    task_list {
        int id
        string name
        string description
        datetime updated_at
        datetime created_at
    }
    task {
        int id 
        string name
        string description
        int priority
        datetime due_date
        datetime updated_at
        datetime created_at
    }
    task_tag {
        int id
        string name
        datetime updated_at
        datetime created_at
    }

    task_check {
        int id
        string description
        boolean complete
        datetime updated_at
        datetime created_at
    }

    purchase {
        int id 
        string name
        string description
        datetime due_date
    }

    purchase_link {
        int id 
        boolean complete
        float value
        string url
        datetime updated_at
        datetime created_at
    }
```

