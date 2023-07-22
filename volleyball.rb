points = { my_point: 0, rival_point: 0 }

def tos
  tos = rand(1..100)
end

def add_my_point(points, action)
  p "敵の#{action}失敗！味方に１ポイント！"
  points[:my_point] += 1
  p "味方のポイント:#{points[:my_point]}"
end

def add_rival_point(points, action)
  p "味方の#{action}失敗！敵に１ポイント！"
  points[:rival_point] += 1
  p "敵のポイント:#{points[:rival_point]}"
end

while points[:my_point] < 3 && points[:rival_point] < 3 do
  if points[:my_point] >= 3 || points[:rival_point] >= 3
    break
  end
  p "味方のサーブ"
  if tos >= 30
    p "敵のアンダートス"
    tos
    if tos >= 20
      p "成功！敵のオーバートス！"
      tos
      if tos >= 10
        p "成功！敵のアタック！"
        if tos >= 80
          add_my_point(points, "アタック")
        else
          add_rival_point(points, "ブロック")
          if points[:my_point] >= 3 || points[:rival_point] >= 3
            break
          end        
          p "敵のサーブ"
          if tos >= 30
            p "味方のアンダートス"
            tos
            if tos >= 20
              p "成功！味方のオーバートス！"
              tos
              if tos >= 10
                p "成功！味方のアタック！"
                if tos >= 80
                  add_rival_point(points, "アタック")
                else
                  add_my_point(points, "ブロック")
                end
              else
                add_rival_point(points, "アタック")
              end
            else
              add_rival_point(points, "オーバートス")
            end
          else
            add_rival_point(points, "アンダートス")
          end
        end
      else
        add_my_point(points, "アタック")
      end
    else
      add_my_point(points, "オーバートス")
    end
  else
    add_my_point(points, "アンダートス")
  end
end

if points[:my_point] >= 3
  p "味方の勝ち！"
elsif points[:rival_point] >= 3
  p "敵の勝ち！"
else
  p "引き分け！"
end