module Naka
  module Api
    class Battle < Base
      def start(area_id, area_no, deck_id = 1, formation_id = 1)
        response = request '/kcsapi/api_req_map/start', api_formation_id: formation_id, api_deck_id: deck_id, api_maparea_id: area_id, api_mapinfo_no: area_no
        Naka::Models::Battle::Move.from_api(response)
      end

      def battle(formation = 1)
        response = request '/kcsapi/api_req_sortie/battle', api_formation: formation
        Naka::Models::Battle::Battle.from_api(response)
      end

      def midnight
        response = request '/kcsapi/api_req_battle_midnight/battle'
        Naka::Models::Battle::MidnightBattle.from_api(response)
      end

      def result
        request '/kcsapi/api_req_sortie/battleresult'
      end

      def next
        response = request '/kcsapi/api_req_map/next'
        Naka::Models::Battle::Move.from_api(response)
      end

      def midnight_battle(formation = 1)
        response = request '/kcsapi/api_req_battle_midnight/sp_midnight', api_formation: formation
        Naka::Models::Battle::MidnightBattle.from_api(response)
      end

      def night_to_day(formation = 1)
        response = request '/kcsapi/api_req_sortie/night_to_day', api_formation: formation
        Naka::Models::Battle::Battle.from_api(response)
      end

      def finish
        request '/kcsapi/api_auth_member/logincheck'
      end
    end

    Manager.register :battle, Battle
  end
end
