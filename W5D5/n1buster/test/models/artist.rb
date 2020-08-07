class Artist
  has_many :albums,
    class_name: 'Album',
    foreign_key: :artist_id,
    primary_key: :id

  def n_plus_one_tracks
    albums = self.albums
    tracks_count = {}
    albums.each do |album|
      tracks_count[album.name] = album.tracks.length
    end

    tracks_count
  end

  def better_tracks_query
    # TODO
    albums = self
        .albums
        .select('albums.*, COUNT(*) AS count_tracks')
        .joins(:tracks)
        .group('albums.id')

    counts = {}

    albums.each{|ele| counts[ele.title] = ele.count_tracks}

    counts
  end
end