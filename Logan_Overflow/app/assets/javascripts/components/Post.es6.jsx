class Post extends React.Component {
  componentWillMount(){
    $.ajax({
      url: "/posts/show/"+ this.props.post.id
    })
    .done((response) => {
      console.log("this is the done");
      this.setState({post: response});
    })
  }
  render() {
    let { post } = this.props
    return (
      <article className="post">
      <h1><strong>Question:</strong>
         { post.title }
      </h1>

      <p> <strong> Description: </strong>
         {post.content}
      </p>
      </article>
    )
  }
}
