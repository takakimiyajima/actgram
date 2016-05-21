class OmniauthCallbacksController < Devise::OmniauthCallbacksController
   
    def all
      # providerとuidでuserレコードを検索。存在しなければ、新たに作成する
      user = User.find_for_oauth(request.env["omniauth.auth"])
      #puts 'aaaaaa'
      #binding.pry
      
      if user == nil
          # uidとproviderを保存。
          user = request.env["omniauth.auth"].uid
          user = request.env["omniauth.auth"].provider
          puts user
      else
          #return redirect_to new_user_session_path
          return redirect_to user_show_path
          
      end
      # # userレコードが既に保存されているか
      # if user.persisted?
      #   # ログインに成功
      #   flash.notice = "ログインしました!!"
      #   sign_in_and_redirect user
      # else
      #   # ログインに失敗し、サインイン画面に遷移
      #   session["devise.user_attributes"] = user.attributes
      #   redirect_to new_user_registration_url
      # end
      #redirect_to new_user_registration_url
    end
  
    # alias_methodはクラスやモジュールのメソッドに別名をつけます。
    # 実態がallメソッドのinstagramメソッドを定義しています
    # こうすることで、様々なメソッド名で同じ処理を実装することができます。
    # OAuthの処理はほとんど同じためこのようにしています。
    # 例えば、Facebookに対応する場合、alias_method :facebook, :allだけですみます。
    alias_method :instagram, :all   #alias_method(new_name, original_name
    
    
      private 
    
        def omniauth
          @omniauth ||= request.env["omniauth.auth"].slice(:provider, :uid)
        end

end