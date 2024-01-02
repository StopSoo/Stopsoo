import Card from './Card.jsx';

function ProfileCard(props) {
  return (
    <Card title="Jisoo Jeong" backgroundColor="#4ea04e">
      {/* 아래 내용은 children을 통해 Card로 전달됨 */}
      <p>안녕하세요, 정지수입니다.</p>
      <p>children을 사용해보려고 합니다.</p>
    </Card>
  );
}

export default ProfileCard;