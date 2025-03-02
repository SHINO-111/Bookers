class BooksController < ApplicationController

  def index
    @books = Book.all 
    @book = Book.new
    
  end


  def create
    @book = Book.new(book_params)
    @books = Book.all 
     # データを保存
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      render :index
    end
   end

 

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @books = Book.all 
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book.id)
    else
      flash.now[:alert] = "Book was not successfully updated."
      render :edit
    end

  end
  
  def destroy
    book = Book.find(params[:id])  
    if book.destroy 
      flash[:notice] = "Book was successfully destroyed."
      redirect_to books_path
    else
      flash.now[:alert] = "Book was not successfully destroyed."
      render :index
    end
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end


end
