# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb
# db/seeds.rb

puts "Limpando dados antigos..."
Lesson.destroy_all
Trail.destroy_all
User.destroy_all

puts "Criando usuário padrão..."
user = User.create!(
  email_address: "admin@example.com",
  password: "password",
  password_confirmation: "password"
)

puts "Criando trilhas e módulos..."

trails = [
  {
    title: "Aprenda Ruby do Zero",
    description: "Descubra os fundamentos da linguagem Ruby, sua sintaxe elegante e poderosa.",
    lessons: [
      "Introdução ao Ruby",
      "Tipos de Dados e Variáveis",
      "Estruturas de Controle",
      "Métodos e Blocos",
      "Orientação a Objetos com Ruby"
    ]
  },
  {
    title: "Dominando Ruby on Rails",
    description: "Construa aplicações web modernas com o poderoso framework Rails.",
    lessons: [
      "Introdução ao Rails",
      "MVC na Prática",
      "Rotas e Controllers",
      "Banco de Dados com ActiveRecord",
      "Autenticação e Autorização",
      "Deploy com Heroku"
    ]
  },
  {
    title: "Python para Iniciantes",
    description: "Aprenda Python, uma das linguagens mais populares e versáteis do mercado.",
    lessons: [
      "Primeiros Passos com Python",
      "Manipulação de Strings",
      "Listas, Tuplas e Dicionários",
      "Funções em Python",
      "Trabalhando com Arquivos"
    ]
  },
  {
    title: "Rust Essencial",
    description: "Explore os conceitos da linguagem Rust e sua abordagem segura de memória.",
    lessons: [
      "O que é Rust?",
      "Instalação e Primeiros Passos",
      "Variáveis e Tipagem",
      "Controle de Fluxo",
      "Ownership e Borrowing",
      "Criando um CLI com Rust"
    ]
  },
  {
    title: "Git e GitHub na Prática",
    description: "Versione seus projetos como um profissional usando Git e GitHub.",
    lessons: [
      "Conceitos Básicos de Controle de Versão",
      "Comandos Git Essenciais",
      "Trabalhando com Branches",
      "Pull Requests e Colaboração",
      "GitHub Actions (CI/CD)"
    ]
  }
]

trails.each do |trail_data|
  trail = Trail.create!(
    title: trail_data[:title],
    description: trail_data[:description],
    user: user
  )
  trail_data[:lessons].each_with_index do |lesson_title, index|
    Lesson.create!(
      title: lesson_title,
      content: "Conteúdo do módulo: #{lesson_title}",
      trail: trail
    )
  end
end

puts "Seeds criadas com sucesso!"
