require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class PrestoDoctor < OmniAuth::Strategies::OAuth2
      BASE_USER_API = '/api/v1/user'
      SCOPES = {
          USER_INFO: 'user_info',
          RECOMMENDATION: 'recommendation',
          PHOTO_ID: 'photo_id'
      }

      option :name, :prestodoctor

      option :client_options, {
                                site: 'https://prestodoctor.com',
                                authorize_url: '/oauth/authorize'
                            }

      uid { raw_info['id'] }

      info do
        raw_info
      end

      extra do
        {
            recommendation: recommendation,
            photo_id: photo_id
        }
      end

      def raw_info
        @raw_info ||= has_scope?(SCOPES[:USER_INFO]) ? access_token.get(BASE_USER_API).parsed : nil
      end

      def recommendation
        @raw_rec ||= has_scope?(SCOPES[:RECOMMENDATION]) ? access_token.get(BASE_USER_API + '/recommendation').parsed : nil
      end

      def photo_id
        @raw_photo_id ||= has_scope?(SCOPES[:PHOTO_ID]) ? access_token.get(BASE_USER_API + '/photo_id').parsed : nil
      end

      private

      def has_scope?(scope_name)
        return false unless access_token.params['scope']
        scopes = access_token.params['scope'].split(' ')
        scopes.include? scope_name
      end
    end
  end
end
