abstract class EntityMapper<E, D> {

  D mapFromEntity(E entity);
  E mapFromDomain(D domain);
}