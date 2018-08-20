Rails.application.routes.draw do


                                                    #勤怠管理
  resources :attends do
    collection do
      get :start
    end
    member do
      get :finish
      get :rest_time_start
      get :rest_time_end
    end
  end


                                                 #ログイン切り替え
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }


                                                   #勤怠クリック

  get 'home/list'
root to: "home#index"
  resources :home



                                            #問い合わせフォーム

  get 'contact' => 'contact#index'
  post 'contact/confirm' => 'contact#confirm'
  post 'contact/thanks' => 'contact#thanks'


                                            #会社情報・就業情報
  resources :companies

  #就業規則
  resources :employments

   #各従業員情報・雇用契約書情報
  resources :workers do
    collection do
       get :salary
    end
    member do
        get :print
    end
  end


                                                   #表側ページ
  get 'tops/index'
  get 'tops/smart'
  get 'tops/venture'
  get 'tops/price'
  get 'tops/company'
  get 'tops/contact'





  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
