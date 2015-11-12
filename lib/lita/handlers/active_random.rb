require "lita"

module Lita
  module Handlers
    class ActiveRandom < Handler
      route /mic ?drop|drop( ?the)? ?mic/,                   :mic_drop
      route /\bhow( shit)? works\b/,                         :how_shit_works
      route /\bbig ?data\b/,                                 :big_data
      route /\bcach(e|ing) ?bug\??\b/,                       :cache_bug
      route /\bcocaine\b/,                                   :cocaine
      route /\b(ha(ha)+|lol)\b/i,                            :haha
      route /\bbutler\b/i,                                   :bob_the_butler
      route /\b(dis|this)( is)? gon(na)? be? g(u|oo)d\b/,    :dis_gon_b_gud
      route /\bhmm*\b/i,                                     :pensive_nate
      route /\bdemeter\b/i,                                  :say_demeter_again
      route /\bgrapes\b/i,                                   :fuck_yo_grapes
      route /\b(wub ?(wub)?|dub(step)?|d+rop.*bas(s|e))\b/i, :ddddddrop_the_bass
      route /\b(mad|angry|rage)\b/i,                         :u_mad_bro
      route /\bno+pe+\b/i,                                   :nope_nope_nope
      route /\bbusted\b/i,                                   :busted
      route /\bdevops\b/i,                                   :devops
      route /\bbeemo\b/i,                                    :beemo
      route /\bto+t(ally|es)\b/i,                            :toooootally
      route /\bIT IS DECIDED\!?\b/,                          :it_is_decided
      route /\boh? (yo)?u so\b/i,                            :oh_you_so
      route /\bmind blown\b/i,                               :mind_blown
      route /\bhubot\b/i,                                    :hubot
      route /\bpineapple (.+)\b/i,                           :pineapple
      route /\bgooo+d\b/i,                                   :goooood
      route /.*/,                                            :quoth_the_devin
      route /\bI love you.*lita\b/i,                         :lita_love
      route /\bI love you\b/i,                               :lita_love,          command: true
      route /\ba?re? y?o?u drunk/i,                          :r_u_drunk,          command: true
      route /\bdownload( more)? ram\b/i,                     :download_ram,       command: true
      route /\bdo (yo)?u( even)? (work( )?out|lift)\b/i,     :do_u_workout,       command: true
      route /\Aping\z/i,                                     :ping,               command: true

      def quoth_the_devin response
        if response.message.source.user.name == "Devin Clark"
          with_a_percent_chance_of 0.05 do
            after 5 do |_|
              response.reply "> #{response.message.body}", " — Devin Mathew Clark"
            end
          end
        end
      end

      def mic_drop response
        drops = %w[
          http://i.imgur.com/MpEqxwM.gif
          http://i.imgur.com/YANYG8d.gif
          http://i.imgur.com/ZxZUyH9.gif
          http://i.imgur.com/9XVQlvS.gif
          http://i.imgur.com/XTWiamq.gif
          http://i.imgur.com/3hkSF89.gif
        ]
        response.reply drops.sample
      end

      def how_shit_works response
        response.reply 'http://i.imgur.com/RwxNVbV.png'
      end

      def big_data response
        response.reply 'http://i.imgur.com/U6m4s4o.jpg'
      end

      def cache_bug response
        bugs = [  'http://i.imgur.com/mus48mo.jpg',
                  'http://i.imgur.com/Mt669js.png',
                  'http://i.imgur.com/OzI9RZq.jpg']
        response.reply bugs.sample
      end

      def cocaine response
        response.reply 'http://i.imgur.com/A3QICEQ.gif'
      end

      def haha response
        count = redis.get('active_random.haha.count').to_i || 0
        count += 1
        if count >= 93
          count = 0
          response.reply "https://s3.amazonaws.com/giphymedia/media/Ic97mPViHEG5O/giphy.gif"
        end
        redis.set('active_random.haha.count', count)
      end

      def ping response
        pongs = ['PONG!', 'Can I help you?', "Yes...I'm still here.", "I'm alive!"]
        response.reply pongs.sample
      end

      def bob_the_butler response
        response.reply 'http://i.imgur.com/03Z2wsy.jpg'
      end

      def dis_gon_b_gud response
        guds = %w[
          http://i.imgur.com/j7PKhl1.gif
          http://i.imgur.com/mtHKey3.gif
          http://i.imgur.com/uh5A6.gif
          http://i.imgur.com/o3o1fU3.gif
        ]
        response.reply guds.sample
      end

      def pensive_nate response
        with_a_percent_chance_of 0.2 do
          response.reply "http://i.imgur.com/4PaAUu5.png"
        end
      end

      def say_demeter_again response
        response.reply "http://i.imgur.com/Z0jvLNm.jpg"
      end

      def fuck_yo_grapes response
        response.reply "http://i.imgur.com/v4y3BLl.gif"
      end

      def ddddddrop_the_bass response
        wubs = %w[
          http://s3-ec.buzzfed.com/static/enhanced/webdr03/2013/2/15/9/anigif_enhanced-buzz-27236-1360939858-5.gif
          http://s3-ec.buzzfed.com/static/enhanced/webdr01/2013/2/15/9/anigif_enhanced-buzz-5139-1360939681-14.gif
          http://s3-ec.buzzfed.com/static/enhanced/webdr02/2013/2/15/11/enhanced-buzz-3235-1360947432-2.jpg
          http://i1212.photobucket.com/albums/cc460/bbtlv/dubstep.gif
          http://i.imgur.com/kUtovs7.gif
        ]
        response.reply wubs.sample
      end

      def u_mad_bro response
        mads = %w[
          http://24.media.tumblr.com/e48acd4c34a62200a81df7259ab31d57/tumblr_n2kygg41US1rzgx44o1_400.gif
          http://i1248.photobucket.com/albums/hh490/Andrea2awesome/internet-memes-y-u-mad-tho.jpg
          http://i.imgur.com/KEh9WOT.png
        ]
        response.reply mads.sample
      end

      def nope_nope_nope response
        nopes = %w[
          http://i.imgur.com/ZG8Y5XQ.gif
          http://i.imgur.com/yBE4JbR.jpg
          http://i.imgur.com/DgczUtV.png
        ]
        response.reply nopes.sample
      end

      def busted response
        response.reply "http://i.imgur.com/MasM57I.png"
      end

      def devops response
        response.reply "http://i.imgur.com/Ujxb5gn.png"
      end

      def beemo response
        response.reply "http://25.media.tumblr.com/tumblr_lwxdpiz2nL1r32wpdo1_400.gif"
      end

      def toooootally response
        if percent_chance_of? 0.2
          response.reply "http://i.imgur.com/XuTdELg.jpg"
        else
          response.reply "to#{'o' * (0..9).to_a.sample}tally"
        end
      end

      def it_is_decided response
        response.reply "http://i.imgur.com/80PQSCo.gif"
      end

      def oh_you_so response
        thing = %w[special clever crazy silly].sample
        response.reply "oh you so #{thing}"
      end

      def mind_blown response
        response.reply "http://www.ripcitybadboys.com/wp-content/uploads/2014/02/mind-blown-2.gif"
      end

      def hubot response
        response.reply "hubot??"
        after(1) { |timer| response.reply "HUBOT?!?!" }
        after(2) { |timer| response.reply "psshh" }
      end

      def pineapple response
        pineapples = %w[
          http://s.quickmeme.com/img/e3/e323d07708b52965621f587d9e80dcff6ae51bedc02096eaee415fa3eb9e237b.jpg
          http://misseytwisted.files.wordpress.com/2013/09/3qdjjp.jpg
          http://www.feastsoffury.com/wp-content/uploads/2013/10/skyler-shut-up.gif
          https://quizzicalllama.files.wordpress.com/2013/10/76081-adam-sandler-haha-shut-up-gif-mh2n.gif
          http://cdn.memegenerator.net/instances/500x/44569345.jpg
        ]
        response.reply "Pineapple #{response.message.body}, PINEAPPLE!"
        after(1) { |timer| response.reply "pineapple means shut the fuck up!" }
        after(4) { |timer| response.reply pineapples.sample }
      end

      def goooood response
        response.reply %w[
          http://i.imgur.com/1jtr4HM.png
          http://torwars.com/wp-content/uploads/2011/10/darth-sidious.jpg
          http://i.imgur.com/j83QRp7.png
          http://i.imgur.com/rm8NcQC.jpg
          http://i.imgur.com/nmC7Hnb.jpg
        ].sample
      end

      def lita_love response
        response.reply "aww, I love you too, #{response.user.name}!"
      end

      def r_u_drunk response
        response.reply "http://i.imgur.com/6soruXq.jpg"
      end

      def download_ram response
        response.reply "downloading more RAMs (courtesy of downloadmoreram.com)..."
        after(1) { |timer| response.reply "downloading more RAMs..." }
        after(2) { |timer| response.reply "downloading more RAMs..." }
        after(3) { |timer| response.reply "All RAMs downloaded!" }
      end

      def do_u_workout response
        response.reply "http://i.imgur.com/EoqKfIx.jpg"
      end

      private

      def with_a_percent_chance_of percent, &block
        block.call if percent_chance_of? percent
      end

      def percent_chance_of? percent
        percent >= Random.rand
      end

    end
    Lita.register_handler ActiveRandom
  end
end
