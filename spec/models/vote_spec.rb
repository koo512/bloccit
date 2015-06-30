describe Vote do
  describe "validations" do
    describe "value validation" do
      it "only allows -1 or 1 as values" do
        @post = Post.create(title: 'post title', body: 'post body')
        @post.votes.create(value: 1)
        @post.votes.create(value: -1)
        @post.votes.create(value: 5)
        expect(@post.up_votes).to eq(1)
        expect(@post.down_votes).to eq(1)
        expect(@post.points).to eq(0)
      end
    end
  end
end