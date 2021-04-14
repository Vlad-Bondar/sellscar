module SortPosts
  def sort_by_params(params,posts)
    case params
    when "oldest"  
      sort_by_date_created(posts)
    when "newest" 
      sort_by_date_created_reverse(posts)
    when "expencive"  
      sort_by_price_max_to_min(posts)
    when "cheapest" 
      sort_by_price_min_to_max(posts)
    else
      posts
    end
  end

  def sort_by_price_max_to_min(posts)
    posts.sort_by { |x| x.car[:price] }.reverse
  end

  def sort_by_price_min_to_max(posts)
    posts.sort_by { |x| x.car[:price] }
  end

  def sort_by_date_created(posts)
    posts.order('created_at')
  end

  def sort_by_date_created_reverse(posts)
    posts.order('created_at').reverse
  end
end