class PostList extends React.Component {
    constructor(){
      super();
      this.state = {
        posts: []
      };
    }
    componentDidMount(){
      $.ajax({
        url: "/posts/recent"
      })
      .done((response) => {
        this.setState({posts: response});
      })
    }
  render() {
    let { posts } = this.state;
    return (
      <div className="container-posts">
        <h1>Questions</h1>
        <ul>
        { posts.map((post, i) =>
          <div key={i} className="post">
            <span>{post.votes.length}</span>
            <li><a href={`/posts/${post.id}`}>{post.title}</a></li>
          </div>
          )
        }
        </ul>
      </div>
    )
  }
}
