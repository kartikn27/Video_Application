class VideosController < ApplicationController

  def index
    response_obj = make_get_videos_request
    @video_info_index = []
    response_obj['response'].each do |video|
      @video_info_index.push({'id' => video['_id'],
                              'title' => video['title'],
                              'thumbnail' => video['thumbnails'][1]['url'],
                              'subscription_required' => video['subscription_required']})
    end
  end

  def show
    response_obj = make_get_video_request
    @video_info_show = response_obj

    @video_id = 'zype' + '_' + @video_info_show['_id']
    @video_src = I18n.t('video_player.domain') + @video_info_show['_id'] + I18n.t('video_player.app_key') + I18n.t('app_key')

    if @video_info_show['subscription_required'].eql?(true) and current_user_token
      @video_src_sub = I18n.t('video_player.domain') + @video_info_show['_id'] + I18n.t('video_player.access_token') + current_user_token
    end
  end

  private

  def make_get_videos_request
    videos_url = I18n.t('video_url') + '?app_key=' + I18n.t('app_key')
    response = RestClient.get videos_url
    response_obj = JSON.parse(response.body)
    response_obj
  end

  def make_get_video_request
    video_url = I18n.t('video_url') + '/' + params[:id] + '?' + 'app_key=' + I18n.t('app_key')
    response = RestClient.get video_url
    response_obj = JSON.parse(response.body)['response']
    response_obj
  end

end
