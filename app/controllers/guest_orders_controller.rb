class GuestOrdersController < ApplicationController
    def index
      @guest_orders = GuestOrder.all
    end

    def new 
      @guest_order = GuestOrder.new
    end

    def destroy
      @guest_order = GuestOrder.find(params[:id])
      @guest_order.destroy!
      redirect_to guest_orders_path, status: :see_other 
    end
  
    def create 
      @guest_order = GuestOrder.new(guest_order_params)
      @guest_order.total = 0
      calculate_order_total
      if @guest_order.save
        session[:guest_order_id] = @guest_order.id
        redirect_to guest_order_path(@guest_order)
      else
        flash.now['danger'] = '失敗しました'
        render :new
      end
    end

    def edit
      @guest_order = GuestOrder.find(params[:id])
    end

    def update
      @guest_order = GuestOrder.find(params[:id])
      if @guest_order.update(guest_order_params)
        session[:guest_order_id] = @guest_order.id
        redirect_to guest_order_path(@guest_order)
      else
        flash.now['danger'] = '失敗しました'
        render :new
      end
    end

    def show 
        @guest_order = GuestOrder.find(params[:id])
        @menu_items = {
            takoyaki_6s: 'たこ焼き6個入り',
            takoyaki_8s: 'たこ焼き8個入り',
            takoyaki_10s: 'たこ焼き10個入り',
            takoyaki_12s: 'たこ焼き12個入り',
            fried_takoyaki: 'あげたこ',
            cold_takoyaki: '冷凍たこ焼き',
            yakisoba: '焼きそば',
            yakisoba_1_half: '焼きそば1.5玉',
            yakisoba_egg: '焼きそば卵のせ',
            sobamesi: 'そば飯',
            beer: 'ビール',
            happoshu: '発泡酒'

        }
    end
  
    private
  
    def guest_order_params
      params.require(:guest_order).permit(
        :name, :takoyaki_6s, :takoyaki_8s, :takoyaki_10s, :takoyaki_12s,
        :fried_takoyaki, :cold_takoyaki, :yakisoba, :yakisoba_1_half,
        :yakisoba_egg, :sobamesi, :beer, :happoshu
      )
    end
  
    def calculate_order_total
      menu_items = {
        takoyaki_6s: 350, takoyaki_8s: 400, takoyaki_10s: 500, takoyaki_12s: 600,
        fried_takoyaki: 200, cold_takoyaki: 1500, yakisoba: 450, yakisoba_1_half: 500,
        yakisoba_egg: 500, sobamesi: 600, beer: 300, happoshu: 200
      }
  
      menu_items.each do |item, price|
        @guest_order.total += @guest_order.send(item).to_i * price
      end
    end
  end
  