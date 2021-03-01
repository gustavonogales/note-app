/* eslint-disable object-curly-newline */
import React, { ReactElement, ReactNode, useEffect, useState } from 'react';
import { Container } from './styles';
import User from '../../models/User';

type ProfilePicProps = {
  user: User;
  onClick?(): void;
  size?: number;
  children?: ReactNode;
};

export function ProfilePic({
  onClick,
  user,
  size = 32,
  children,
}: ProfilePicProps): ReactElement {
  const [initials, setInitials] = useState('');
  useEffect(() => {
    const fullName = user.name.split(' ');
    setInitials(`${fullName.shift()?.charAt(0)}${fullName.pop()?.charAt(0)}`);
  }, [user]);

  return (
    <Container onClick={onClick} size={size} avatar_url={user.avatar_url}>
      {!user.avatar_url && <span>{initials}</span>}
      {children}
    </Container>
  );
}
