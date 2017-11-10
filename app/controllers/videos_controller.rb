class VideosController < ApplicationController

  def index
    videos_url = I18n.t('video_url') + '?app_key=' + I18n.t('app_key')

    response = RestClient.get videos_url
    response_obj = JSON.parse(response.body)
    @video_info = []
    response_obj['response'].each do |video|
      logger.info(video['thumbnails'][1]['url'])
      @video_info.push({'id' => video['_id'],
                        'title' => video['title'],
                        'thumbnail' => video['thumbnails'][1]['url'],
                        'subscription_required' => video['subscription_required']})
    end
    logger.info(@video_info)

  end

end
