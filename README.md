<%= f.label :生年月日 %>
      <%= raw sprintf(
            f.date_select( :birth_date, use_month_numbers: true, start_year: 1930,
              end_year: (Time.now.year), default: Date.new(1989, 1, 1), date_separator: '%s'), '年 ', '月 ') + '日' %>
      
      <%= f.label :性別 %><br />
      <%= f.label :男性  %>
      <%= f.radio_button :gender, :man %>
      <%= f.label :女性  %>
      <%= f.radio_button :gender, :woman %>
      
      enum gender: { man: 0, woman: 1}