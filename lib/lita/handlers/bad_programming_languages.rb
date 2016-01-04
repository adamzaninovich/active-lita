require "lita"

module Lita
  module Handlers
    class BadProgrammingLanguages < Handler
      route /\b(java|cobol|vimscript)\W*\b/i, :bad_programming_languages

      def bad_programming_languages response
        response.reply QUOTES[response.matches[0][0].downcase.to_sym].sample
      end

      QUOTES = {
        java: [
          "> If 100 lines of Java code accomplish a task then it looks like you've written 100 lines, even though in a different language it might only take 5 lines. It's like... you can eat a 1 pound steak, or you can eat 100 pounds of shoe leather, and you feel a great sense of accomplishment after the shoe leather, but maybe there are some downsides.\n- Larry Wall",
          "> Java is sort of the COBOL of the 21st century, I think. It's heavyweight, verbose, and everyone loves to hate it, though not everyone will admit that.\n- Larry Wall",
          "> Using Java for serious jobs is like trying to take the skin off a rice pudding wearing boxing gloves.\n- Tel Hudson",
          "> If Java had true garbage collection, most programs would delete themselves upon execution.\n- Robert Sewell",
          "> Java is the SUV of programming tools. A project done in Java will cost 5 times as much, take twice as long, and be harder to maintain than a project done in a scripting language such as PHP or Perl. … But the programmers and managers using Java will feel good about themselves because they are using a tool that, in theory, has a lot of power for handling problems of tremendous complexity. Just like the suburbanite who drives his SUV to the 7-11 on a paved road but feels good because in theory he could climb a 45-degree dirt slope\n-Philip Greenspun",
          "> Java is a DSL to transform big XML documents into long exception stack traces.\n- Scott Bellware",
          "> Java is the Dark Souls of programming languages.\n- Devin Clark",
          "http://harmful.cat-v.org/software/_java/problem-factory.jpg"
        ],
        cobol: [
          "> The use of COBOL cripples the mind; its teaching should, therefore, be regarded as a criminal offense.\n- Edsger Dijkstra",
          "> Cobol has almost no fervent enthusiasts. As a programming tool, it has roughly the sex appeal of a wrench.\n- Charles Petzold",
          "> A computer without COBOL and FORTRAN is like a piece of chocolate cake without ketchup or mustard.\n- John Krueger"
        ],
        vimscript: [
          "> Vimscript is a rabbit hole of sadness and despair.\n- Steve Losh",
          "> The worst part about writing Vim plugins is, without a doubt, dealing with Vimscript. It’s an esoteric language that’s grown organically over the years seemingly without any strong design direction.\n- Steve Losh",
          "> The [vimscript] syntax is terse, ugly and inconsistent. Is `\" foo` a comment? Sometimes.\n- Steve Losh"
        ]
      }

    end
    Lita.register_handler(BadProgrammingLanguages)
  end
end
