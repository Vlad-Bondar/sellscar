import React from "react"
import Comment from './Comment';

class Comments extends React.Component {
  render () {
    console.log(this.props.owner_name)
    return (
        this.props.comments.map((comment, index) => {
          return <Comment key={index} comment={comment} post_id={this.props.post_id} replies={this.props.replies[comment.id]} owner_name={this.props.name}/>
        })
    );
  }
}

export default Comments