Rails.application.routes.draw do

  get 'inquiry/index'
  get 'inquiry' => "inquiry#new"
  post 'inquiry'=> "inquiry#create"

  get 'inquiry/show'

  get 'info' => "info#index"
  get 'info/new'
  get 'info/show'
  get 'info/edit'


  root to: 'home#top'

  get 'about' => "home#about"
  get 'about/agreement' => 'home#agreement'
  get 'about/constitution' => 'home#constitution'

  get 'seminar' => "home#seminar"
  get 'seminar/schedule' => "schedules#index"
  get 'seminar/kyujitsu' => "home#weekend"
  get 'seminar/heijitsu' => "home#weekday"
  get 'seminar/jissen' => "home#practice"

  get 'system' => "home#system"

  get 'member' => "home#member"

  get 'entry' => "entries#new"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
