namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando BD...") { %x(rails db:drop) }
      show_spinner("Criando BD...") { %x(rails db:create) }
      show_spinner("Migrando BD...") { %x(rails db:migrate) }
      %x(rails dev:add_states)
      %x(rails dev:add_ongs) 
    else 
      puts 'Você não está em ambiente de desenvolvimento'
    end
  end

  desc "Cadastrando ongs"
  task add_ongs: :environment do 
    show_spinner("Cadastrando ongs") do
      ongs = [
        {
          nome: 'MundoPet',
          email: 'mundopet@gmail.com',
          logo: 'https://img.freepik.com/fotos-gratis/o-gato-vermelho-ou-branco-eu-no-estudio-branco_155003-13189.jpg?w=2000',
          state: State.find_by(initials: 'CE')
          
        },
        {
          nome: 'AnimalWorld',
          email: 'animalworld@gmail.com',
          logo: 'https://www.petz.com.br/blog/wp-content/uploads/2021/02/raca-de-cachorro-grande-2-1280x720.jpg',
          state: State.all.sample
        },
        {
          nome: 'PetVida',
          email: 'petvida@gmail.com',
          logo: 'https://www.petz.com.br/blog/wp-content/uploads/2021/02/raca-de-cachorro-grande-2-1280x720.jpg',
          state: State.all.sample
        }
      ]
      ongs.each do |ong| 
        Ong.find_or_create_by!(ong)
      end
    end
  end

  desc "Cadastrando estados"
  task add_states: :environment do
    show_spinner("Cadastrando estados") do
      states = [
        {description: 'Ceará', initials: 'CE'},
        {description: 'Amapá', initials: 'AM'},
        {description: 'Bahia', initials: 'BA'},
        {description: 'Rio Grande Do Sul', initials: 'RS'},
        {description: 'Rio Grande Do Norte', initials: 'RN'}, 
        {description: 'Acre', initials: 'AC'}, 
        {description: 'São Paulo', initials: 'SP'}, 
        {description: 'Minas Gerais', initials: 'MG'}, 
        {description: 'Espirito Santo', initials: 'ES'}, 
        {description: 'Alagoas', initials: 'AL'}, 
        {description: 'Pará', initials: 'PA'}, 
        {description: 'Amazonas', initials: 'AM'}, 
        {description: 'Distrito Federal', initials: 'DF'}, 
        {description: 'Goias', initials: 'GO'}, 
        {description: 'Mato Grosso', initials: 'MT'}, 
        {description: 'Paraíba', initials: 'PB'},
        {description: 'Paraná', initials: 'PR'},
        {description: 'Pernambuco', initials: 'PE'},
        {description: 'Piauí', initials: 'PI'},
        {description: 'Maranhão', initials: 'MA'}, 
        {description: 'Mato Grosso do Sul', initials: 'MS'}, 
        {description: 'Rondônia', initials: 'RO'},
        {description: 'Roraima', initials: 'RR'},
        {description: 'Santa Catarina', initials: 'SC'},
        {description: 'Sergipe', initials: 'SE'}, 
        {description: 'Tocantis', initials: 'TO'}, 
      ]
      states.each do |state|
        State.find_or_create_by!(state)
      end
    end
  end

  # desc "Cadastrando usuários"
  #task add_users: :environment do
    #show_spinner("Cadastrando usuários") do
      #users = [
        #{name: 'Mariano', email: 'nmariano85@gmail.com', password_digest: '12345678'},
     # ]
     # users.each do |user|  
        #User.find_or_create_by!(user)
      #end
    #end
  #end

  private

  def show_spinner(msg_start, msg_end = 'Concluido')
    spinner = TTY::Spinner.new("[:spinner] #{msg_start} ")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end
end
