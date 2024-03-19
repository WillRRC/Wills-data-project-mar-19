class WillsdataController < ApplicationController

  before_action :authorize
  require 'net/http'
  require 'json'
  url = "https://pokeapi.co/api/v2/pokemon?limit=20&offset=0"
  uri = URI(url)
  response = Net::HTTP.get(uri)
  Pokemon = JSON.parse(response)

  url2 = "https://api.coinranking.com/v2/coins"
  uri2 = URI(url2)
  response2 = Net::HTTP.get(uri2)
  Crypto = JSON.parse(response2)

  url3 = "https://swapi.dev/api/people"
  uri3 = URI(url3)
  response3 = Net::HTTP.get(uri3)
  Starwars = JSON.parse(response3)
  def index
    @starwars = Starwars['results']
    @crypto = Crypto['data']['coins']
    @pokemon = Pokemon['results']
    @posts = Post.all
    @members = Member.all
    @member = Member.all
    @memba = Kaminari.paginate_array(@member).page(params[:page]).per(1)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def post_params
      params.require(:post).permit(:post_title, :post_body)
    end
end
